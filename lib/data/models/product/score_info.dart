import 'complaints_info.dart';

class ScoreInfo {
  ScoreInfo({
      this.score, 
      this.scoreText, 
      this.scoreColor, 
      this.scoreBackgroundColor, 
      this.complaintsInfo,});

  ScoreInfo.fromJson(dynamic json) {
    score = json['score'];
    scoreText = json['score_text'];
    scoreColor = json['score_color'];
    scoreBackgroundColor = json['score_background_color'];
    complaintsInfo = json['complaints_info'] != null ? ComplaintsInfo.fromJson(json['complaints_info']) : null;
  }
  double? score;
  String? scoreText;
  String? scoreColor;
  String? scoreBackgroundColor;
  ComplaintsInfo? complaintsInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['score'] = score;
    map['score_text'] = scoreText;
    map['score_color'] = scoreColor;
    map['score_background_color'] = scoreBackgroundColor;
    if (complaintsInfo != null) {
      map['complaints_info'] = complaintsInfo?.toJson();
    }
    return map;
  }

}