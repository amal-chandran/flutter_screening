enum ParticipantType { Mentor, Learner }

class Participant {
  var name;
  var stacks = [];
  var avaliableFrom;
  var avaliableTo;

  ParticipantType type;
  static var Participants = [];

  static getMentor(stack, time) {
    bool findMentor(data) {
      var hasStack = data.stacks.contains(stack.toLowerCase());
      if (hasStack &&
          data.avaliableFrom.isAfter(time) == data.avaliableTo.isBefore(time) &&
          data.type == ParticipantType.Mentor) return true;
      return false;
    }

    return Participant.Participants.where(findMentor);
  }

  Participant(name) {
    this.name = name;
    Participant.Participants.add(this);
  }

  addStacks(String stackName) {
    this.stacks.add(stackName.toLowerCase());
  }

  setMentorOrLearner(ParticipantType type) {
    this.type = type;
  }

  setAvailableTime(avaliableFrom, avaliableTo) {
    this.avaliableFrom = avaliableFrom;
    this.avaliableTo = avaliableTo;
  }
}

void main() {
  var today = new DateTime.now(),
      tomorrow = today.add(new Duration(days: 1)),
      todayAfterAnHr = today.add(new Duration(hours: 1));

  var amal = new Participant("Amal Chandran");
  amal.setMentorOrLearner(ParticipantType.Mentor);
  amal.addStacks("Js");
  amal.addStacks("Python");
  amal.addStacks("PHP");
  amal.setAvailableTime(today, tomorrow);

  var nimu = new Participant("Nimisha");
  nimu.setMentorOrLearner(ParticipantType.Learner);
  nimu.addStacks("Js");
  nimu.addStacks("Python");
  nimu.addStacks("PHP");
  nimu.setAvailableTime(today, tomorrow);

  var anju = new Participant("Anju Ashokan");
  anju.setMentorOrLearner(ParticipantType.Learner);
  anju.addStacks("Js");
  anju.addStacks("Python");
  anju.addStacks("PHP");
  anju.setAvailableTime(today, tomorrow);

  var aswin = new Participant("Aswin");
  aswin.setMentorOrLearner(ParticipantType.Mentor);
  aswin.addStacks("Js");
  aswin.addStacks("Python");
  aswin.addStacks("PHP");
  aswin.setAvailableTime(today, tomorrow);

  Participant.getMentor("Js", todayAfterAnHr).forEach((p) => print(p.name));
}
