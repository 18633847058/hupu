class Match {
  int type;
  String hostTeam;
  String guestTeam;
  int hostGoal;
  int guestGoal;
  int state;

  Match.fromJson(Map json) {
    type = json['type'];
    hostTeam = json['hostteam'];
    guestTeam = json['guestteam'];
    hostGoal = json['hostgoal'];
    guestGoal = json['guestgoal'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'hostteam': hostTeam,
      'guestteam': guestTeam,
      'hostgoal': hostGoal,
      'guestgoal': guestGoal,
      'state': state
    };
  }
}
