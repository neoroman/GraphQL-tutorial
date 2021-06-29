const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('taskMap', {
    userId: {
      type: DataTypes.STRING(32),
      allowNull: false,
      defaultValue: "",
      field: 'USER_ID'
    },
    taskId: {
      type: DataTypes.SMALLINT,
      allowNull: false,
      defaultValue: 0,
      primaryKey: true,
      field: 'TASK_ID'
    },
    projectId: {
      type: DataTypes.SMALLINT,
      allowNull: true,
      field: 'PROJECT_ID'
    },
    status: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'STATUS'
    },
    percentage: {
      type: DataTypes.DOUBLE,
      allowNull: true,
      field: 'PERCENTAGE'
    }
  }, {
    sequelize,
    tableName: 'TASK_MAP',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "idx_memberid_TASK_MAP",
        using: "BTREE",
        fields: [
          { name: "TASK_ID" },
        ]
      },
    ]
  });
};
