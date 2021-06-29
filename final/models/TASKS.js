const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('tasks', {
    taskId: {
      autoIncrement: true,
      type: DataTypes.SMALLINT,
      allowNull: false,
      primaryKey: true,
      field: 'TASK_ID'
    },
    name: {
      type: DataTypes.STRING(32),
      allowNull: true,
      field: 'NAME'
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
    }
  }, {
    sequelize,
    tableName: 'TASKS',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "TASK_ID" },
        ]
      },
      {
        name: "idx_projid_TASKS",
        using: "BTREE",
        fields: [
          { name: "PROJECT_ID" },
        ]
      },
    ]
  });
};
