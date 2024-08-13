// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyTask {
  String name;
  String end;

  MyTask({
    required this.name,
    required this.end,
  });

  List getAllTasks() {
    List myAllTaks = [
      MyTask(
        name: 'Apresentação do caixa com 5 desing patterns',
        end: '16/07/2024',
      ),
      MyTask(
        name: 'Seminário final flutter',
        end: '21/08/2024',
      ),
      MyTask(
        name: 'Aplicativo final flutter',
        end: '28/08/2024',
      ),
    ];
    return myAllTaks;
  }
}
