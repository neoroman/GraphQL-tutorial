const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('timetable', {
    workDay: {
      type: DataTypes.STRING(10),
      allowNull: true,
      defaultValue: "",
      field: 'WORK_DAY'
    },
    workHour: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
      field: 'WORK_HOUR'
    },
    userId: {
      type: DataTypes.STRING(32),
      allowNull: true,
      field: 'USER_ID',
      primaryKey: true
    },
    taskId: {
      type: DataTypes.SMALLINT,
      allowNull: true,
      field: 'TASK_ID'
    },
    projectId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: 'PROJECT_ID'
    }
  }, {
    sequelize,
    tableName: 'TIMETABLE',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "date_TIMETABLE",
        using: "BTREE",
        fields: [
          { name: "WORK_DAY" },
          { name: "USER_ID" },
          { name: "TASK_ID" },
          { name: "PROJECT_ID" },
        ]
      },
    ]
  });
};
