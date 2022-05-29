import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlevel_assignment/models/task_model.dart';
import 'package:highlevel_assignment/utils/constants.dart';
import 'package:provider/provider.dart';

import '../states/tasks_list_state.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _taskTitle, _taskDescription;
  late Duration _duration;

  void _validateAndAddTask() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final task = TaskModel(
        title: _taskTitle,
        description: _taskDescription,
        duration: _duration,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      context.read<TasksListState>().addNewTask(task);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 64,
              top: 48,
              bottom: 60,
            ),
            child: _buildAddTaskForm(),
          ),
          ElevatedButton(
            onPressed: _validateAndAddTask,
            child: const Text(
              'Add Task',
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTaskForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          TextFormField(
            style: const TextStyle(color: Colors.black),
            onSaved: (value) {
              _taskTitle = value!.trim();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a task title';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Superdesigner',
            ),
          ),
          const SizedBox(height: 36),
          TextFormField(
            minLines: 5,
            maxLines: 5,
            style: const TextStyle(color: Colors.black),
            onSaved: (value) {
              _taskDescription = value!.trim();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a task description';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'e.g. john@gmail.com',
            ),
          ),
          const SizedBox(height: 36),
          Text(
            'Duration',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 4),
          _buildDurationPicker()
        ],
      ),
    );
  }

  Widget _buildDurationPicker() {
    return FormField<Duration>(
        onSaved: (value) {
          _duration = value!;
        },
        validator: (value) {
          if (value == null || value == Duration.zero) {
            return 'Please enter a task duration';
          }
          return null;
        },
        initialValue: Duration.zero,
        builder: (FormFieldState<Duration> state) {
          return GestureDetector(
            onTap: () {
              _showDurationPicker(state);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ' ${state.value!.inHours} ',
                      style: TextStyle(
                        fontSize: 27,
                        letterSpacing: -0.25,
                        color: greenColor,
                        backgroundColor: greenColor.withOpacity(0.25),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 17,
                        color: greenColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      ' ${(state.value!.inMinutes) % (60)} ',
                      style: TextStyle(
                        fontSize: 27,
                        letterSpacing: -0.25,
                        color: greenColor,
                        backgroundColor: greenColor.withOpacity(0.25),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 17,
                        color: greenColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      ' ${(state.value!.inSeconds) % (60)} ',
                      style: TextStyle(
                        fontSize: 27,
                        letterSpacing: -0.25,
                        color: greenColor,
                        backgroundColor: greenColor.withOpacity(0.25),
                      ),
                    ),
                  ],
                ),
                if (state.hasError) ...[
                  const SizedBox(height: 8),
                  Text(
                    state.errorText!,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ],
              ],
            ),
          );
        });
  }

  void _showDurationPicker(FormFieldState<Duration> state) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 200,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: state.value!,
          onTimerDurationChanged: state.didChange,
        ),
      ),
    );
  }
}
