// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String name;
  String end;

  TaskModel({
    required this.name,
    required this.end,
  });

  List getAllTasks() {
    List myAllTaks = [
      TaskModel(
        name: 'Apresentação do caixa com 5 desing patterns',
        end: '16/07/2024',
      ),
      TaskModel(
        name: 'Seminário final flutter',
        end: '21/08/2024',
      ),
      TaskModel(
        name: 'Aplicativo final flutter',
        end: '28/08/2024',
      ),
    ];
    return myAllTaks;
  }
}
