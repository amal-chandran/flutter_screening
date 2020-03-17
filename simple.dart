enum ParticipantType { Mentor, Learner }

class Participant {
  var name;
  var stacks = [];
  var avaliableTime;

  ParticipantType type;
  static var Participants = [];

  static getMentor(stack, time) {
    bool findMentor(data) {
      var hasStack = data.stacks.contains(stack.toLowerCase());
      if (hasStack &&
          data.avaliableTime == time &&
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

  setAvailableTime(avaliableTime) {
    this.avaliableTime = avaliableTime;
  }
}

void main() {
  var amal = new Participant("Amal Chandran");
  amal.setMentorOrLearner(ParticipantType.Mentor);
  amal.addStacks("Js");
  amal.addStacks("Python");
  amal.addStacks("PHP");
  amal.setAvailableTime(new DateTime.now());

  var nimu = new Participant("Nimisha");
  nimu.setMentorOrLearner(ParticipantType.Learner);
  nimu.addStacks("Js");
  nimu.addStacks("Python");
  nimu.addStacks("PHP");
  nimu.setAvailableTime(new DateTime.now());

  var mattu = new Participant("Amrutha");
  mattu.setMentorOrLearner(ParticipantType.Learner);
  mattu.addStacks("Js");
  mattu.addStacks("Python");
  mattu.addStacks("PHP");
  mattu.setAvailableTime(new DateTime.now());

  var aswin = new Participant("Aswin");
  aswin.setMentorOrLearner(ParticipantType.Mentor);
  aswin.addStacks("Js");
  aswin.addStacks("Python");
  aswin.addStacks("PHP");
  aswin.setAvailableTime(new DateTime.now());

  Participant.getMentor("Js", new DateTime.now()).forEach((p) => print(p.name));
}
