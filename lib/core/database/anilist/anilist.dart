import 'package:graphql/client.dart';

class Anilist {
  final httpLink = HttpLink("https://graphql.anilist.co");

  search(String query) async {
    final gquery = '''
            query {
                Page(perPage: 10) {
                    media(search: "$query", type: ANIME) {
                        id
                        idMal
                        title {
                            english
                            romaji
                        }
                        coverImage {
                            extraLarge
                            large
                        }
                    }
                }
            }
        ''';
    final data = await fetchQuery(gquery);

    return data;
  }

  getCurrentlyAiringAnime() async {
    final query = '''{
            Page(perPage: 100) {
              media(sort: [START_DATE_DESC], type: ANIME, format: TV, status: RELEASING) {
                id
                title {
                  romaji
                  english
                }
                startDate {
                  year
                  month
                  day
                }
                episodes
                coverImage {
                  large
                  medium
                  color
                }
              }
            }
          }''';

    final data = await fetchQuery(query);

    return data;
  }

  Future getAnimeInfo(int anilistId) async {
    final query = '''
      {
        Page(perPage: 100) {
          media(id: $anilistId) {
            title {
              romaji
              english
              native
              userPreferred
            }
            bannerImage
            synonyms
            coverImage {
              large
              medium
            }
            genres
            description
            source
            type
            episodes
            status
            nextAiringEpisode {
              episode
              airingAt
              timeUntilAiring
            }
            tags {
              name
              category
            }
            startDate {
              year
              month
              day
            },
            endDate {
              year
              month
              day
            },
            meanScore
            studios {
              edges {
                isMain
                node {
                  isAnimationStudio
                  name
                  id
                }
              }
            }
            duration
            popularity
            characters {
              edges {
                node {
                  name {
                    full
                    native
                  }
                  image {
                    large
                    medium
                  }
                }
                role
              }
            }
            recommendations {
        nodes {
          mediaRecommendation {
            id
            type
            title {
              romaji
              english
              native
              userPreferred
            }
            coverImage {
              extraLarge
              large
            }
            
          }
        }
      }
      relations {
        edges {
          relationType
          node {
            id
            type
            title {
              romaji
              english
              native
            }
            coverImage {
              extraLarge
              large
            }
          }
        }
      }
    }
  }
}''';

    try {
      final result = await fetchQuery(query);

      final Map<String, dynamic> info = result[0];

      convertToIAnimeDetails() {
        final List<Map<String, dynamic>> characters = [];

        info['characters']['edges'].forEach((character) {
          characters.add({
            'name': character['node']['name']['full'],
            'role': character['role'],
            'image': character['node']['image']['large'] ??
                character['node']['image']['medium'],
          });
        });

        final List<String> studios = [];

        info['studios']['edges'].forEach((studio) {
          if (studio['node']['isAnimationStudio'] && studio['isMain'] == true) {
            studios.add(studio['node']['name']);
          }
        });

        final List recommended = [];

        info['recommendations']['nodes'].forEach((recommendation) {
          final rec = recommendation['mediaRecommendation'];
          if(rec != null) {
            recommended.add((
              id: rec['id'],
              title: {
                'english': rec['title']['english'],
                'romaji': rec['title']['romaji'],
                'native': rec['title']['native'],
              },
              cover:
                  rec['coverImage']['large'] ?? rec['coverImage']['extraLarge'],
              type: rec['type']
            ));
          }
        });

        final List relations = [];

        info['relations']['edges'].forEach((relation) {
          relations.add((
            id: relation['node']['id'],
            title: {
              'english': relation['node']['title']['english'],
              'romaji': relation['node']['title']['romaji'],
              'native': relation['node']['title']['native'],
            },
            cover: relation['node']['coverImage']['large'] ??
                relation['node']['coverImage']['extraLarge'],
            type: relation['node']['type'],
            relationType: relation['relationType']
          ));
        });

        final convertedGuy = (
          title: {
            'english': info['title']['english'],
            'native': info['title']['native'],
            'romaji': info['title']['romaji'],
          },
          aired: {
            'start':
                '${info['startDate']['day'] ?? ''} ${MonthnumberToMonthName(info['startDate']['month'])?['short'] ?? ''} ${info['startDate']['year'] ?? ''}',
            'end':
                '${info['endDate']['day'] ?? ''} ${MonthnumberToMonthName(info['endDate']['month'])?['short'] ?? ''} ${info['endDate']['year'] ?? ''}',
          },
          banner: info['bannerImage'] ?? '',
          cover: info['coverImage']['large'] ?? info['coverImage']['medium'],
          duration: '${info['duration'] ?? ''} minutes',
          episodes: info['episodes'],
          genres: info['genres'],
          characters: characters,
          nextAiringEpisode: (
            airingAt: info['nextAiringEpisode']?['airingAt'] ?? '',
            timeLeft: info['nextAiringEpisode']?['timeUntilAiring'] ?? '',
            episode: info['nextAiringEpisode']?['episode'] ?? '',
          ),
          rating: (info['meanScore'] / 10)?.toDouble() ?? null,
          recommended: recommended,
          related: relations,
          status: info['status'],
          type: info['type'],
          studios: studios,
          synonyms: info['synonyms'],
          synopsis: info['description'].replaceAll(RegExp(r'<[^>]*>'), "").replaceAll(RegExp(r'\n+'), '\n'),
          tags: info['tags'].map((tag) => tag['name']),
        );

        return convertedGuy;
      }

      return convertToIAnimeDetails();
    } catch (err) {
      print(err);
      throw Exception('Error Getting Anime Details');
    }
  }

  MonthnumberToMonthName(
    dynamic monthNumber,
  ) {
    if (monthNumber == null) return {'short': '', 'full': ''};
    if (monthNumber > 12 || monthNumber < 1) return null;
    const monthName = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return {
      'full': monthName[monthNumber - 1],
      'short': monthName[monthNumber - 1].substring(0, 3),
    };
  }

  fetchQuery(String query) async {
    final GraphQLClient client =
        GraphQLClient(link: httpLink, cache: GraphQLCache());

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult res = await client.query(options);

    if (res.hasException) {
      print(res.exception.toString());
    }

    final data = res.data?['Page']['media'];

    return data;
  }
}
