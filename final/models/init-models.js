var DataTypes = require("sequelize").DataTypes;
var _adminDepartment = require("./ADMIN_DEPARTMENT");
var _adminUser = require("./ADMIN_USER");
var _project = require("./PROJECT");
var _projectUserMap = require("./PROJECT_USER_MAP");
var _tasks = require("./TASKS");
var _taskMap = require("./TASK_MAP");
var _timetable = require("./TIMETABLE");
var _userDept = require("./USER_DEPT");

function initModels(sequelize) {
  var adminDepartment = _adminDepartment(sequelize, DataTypes);
  var adminUser = _adminUser(sequelize, DataTypes);
  var project = _project(sequelize, DataTypes);
  var projectUserMap = _projectUserMap(sequelize, DataTypes);
  var tasks = _tasks(sequelize, DataTypes);
  var taskMap = _taskMap(sequelize, DataTypes);
  var timetable = _timetable(sequelize, DataTypes);
  var userDept = _userDept(sequelize, DataTypes);

  adminDepartment.hasMany(project, { as: "projects", foreignKey: "deptCode"});
  userDept.belongsTo(adminDepartment, { as: "deptCodeAdminDepartment", foreignKey: "deptCode"});
  adminDepartment.hasMany(userDept, { as: "userDepts", foreignKey: "deptCode"});

  return {
    adminDepartment,
    adminUser,
    project,
    projectUserMap,
    tasks,
    taskMap,
    timetable,
    userDept,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
