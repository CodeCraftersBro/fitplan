import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class DurationPickerWidget extends StatefulWidget {
  final int initialDurationSeconds;
  final Function(int) onDurationSelected;

  const DurationPickerWidget({
    Key? key,
    required this.initialDurationSeconds,
    required this.onDurationSelected,
  }) : super(key: key);

  @override
  _DurationPickerWidgetState createState() => _DurationPickerWidgetState();
}

class _DurationPickerWidgetState extends State<DurationPickerWidget> {
  late Duration selectedDuration;

  @override
  void initState() {
    super.initState();
    selectedDuration = Duration(seconds: widget.initialDurationSeconds);
  }

  Future<void> _pickDuration() async {
    final Duration? pickedDuration = await showDurationPicker(
      context: context,
      initialTime: selectedDuration,
    );

    if (pickedDuration != null) {
      setState(() {
        selectedDuration = pickedDuration;
      });
      widget.onDurationSelected(selectedDuration.inSeconds);
    }
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickDuration,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_formatDuration(selectedDuration)}",
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.timer),
          ],
        ),
      ),
    );
  }
}
