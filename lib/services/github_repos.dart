import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GitHubRepos extends StatefulWidget {
  const GitHubRepos({super.key});

  @override
  State<GitHubRepos> createState() => _GitHubReposState();
}

class _GitHubReposState extends State<GitHubRepos> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _repositories = [];
  bool _isLoading = false;
  bool _hasError = false;
  final Dio _dio = Dio();

  Future<void> _fetchRepos(String username) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final response =
          await _dio.get('https://api.github.com/users/$username/repos');

      if (response.statusCode == 200) {
        setState(() {
          _repositories = response.data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          size: 35,
          Icons.track_changes_rounded,
          color: Colors.white,
        ),
        title: const Text(
          'GitHub',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(33, 31, 38, 75),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Qual Username?',
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _fetchRepos(_controller.text);
                    }
                  },
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 196, 196, 196),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _hasError
                    ? const Text(
                        'Erro ao buscar repositórios. Por favor, tente novamente.')
                    : _repositories.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: _repositories.length,
                              itemBuilder: (context, index) {
                                final repo = _repositories[index];
                                return ListTile(
                                  title: Text(repo['name']),
                                  subtitle: Text(
                                      repo['description'] ?? 'Sem descrição'),
                                  onTap: () {
                                    // Ação ao clicar no repositório
                                  },
                                );
                              },
                            ),
                          )
                        : const Text('Nenhum repositório encontrado.'),
          ],
        ),
      ),
    );
  }
}
