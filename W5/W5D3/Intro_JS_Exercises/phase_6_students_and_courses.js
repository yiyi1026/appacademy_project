function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function() {
  return this.firstName + ' ' + this.lastName;
}

Student.prototype.enroll = function(new_course) {
  if (this.courses.includes(new_course)) {
    console.log("Already enrolled");
  } else {
    function anyConflict(course) {
      return course.conflictsWith(new_course);
    }

    let hasConflict = this.courses.some(anyConflict);
    if (hasConflict){
      throw new Error('Conflict with enrolled courses');
    }else{
      this.courses.push(new_course);
      new_course.students.push(this);
    }
  }
}

Student.prototype.courseLoad = function(){
  let courseload = {};
  logCredits = function(course){
    if (courseload[course.department]){
      courseload[course.department] += course.credits;
    }else{
      courseload[course.department] = course.credits;
    }
  }
  this.courses.forEach(logCredits);

  return courseload;
}

function Course(name, department, credits, days, time) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.days = days;
  this.time = time;
}

Course.prototype.addStudent = function(student) {
  student.enroll(this);
}

Course.prototype.conflictsWith = function(course) {
  if (this.time !== course.time) {
    return false;
  }
  anyCommonElement = function(el, idx, arr) {
    return course.days.includes(el);
  }
  return this.days.some(anyCommonElement);
}
