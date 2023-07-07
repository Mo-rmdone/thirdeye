import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

final pathToSaveAudio = 'audio_example.aac';

class SoundRecorder
{

  static FlutterSoundRecorder? _audioRecorder;
  bool isRecordingInitialized = false;
  bool get isRecording => _audioRecorder!.isRecording;
  Future init () async
  {
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted)
      {
        throw RecordingPermissionException('Microphone Permission');
      }

    await _audioRecorder!.openAudioSession();
    isRecordingInitialized = true;
  }

  void dispose()
  {
    if(!isRecordingInitialized) return;
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    isRecordingInitialized = false;
  }

   Future _record () async
  {
    if(!isRecordingInitialized) return;
    await  _audioRecorder!.startRecorder(toFile:pathToSaveAudio);
  }

  Future _stop () async
  {
    if(!isRecordingInitialized) return;
    final path = await _audioRecorder!.stopRecorder();
    print("audioFile $path");
  }

  Future<void> toggle () async
    {
    if( _audioRecorder!.isStopped)
        {
          await _record();
        }
      else{
        await _stop();
      }
    }

}