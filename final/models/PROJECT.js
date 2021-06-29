const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('project', {
    projectId: {
      autoIncrement: true,
      type: DataTypes.SMALLINT,
      allowNull: false,
      primaryKey: true,
      field: 'PROJECT_ID'
    },
    name: {
      type: DataTypes.STRING(64),
      allowNull: true,
      field: 'NAME'
    },
    deptCode: {
      type: DataTypes.STRING(16),
      allowNull: true,
      references: {
        model: 'ADMIN_DEPARTMENT',
        key: 'DEPT_CODE'
      },
      field: 'DEPT_CODE'
    },
    projectCode: {
      type: DataTypes.STRING(32),
      allowNull: true,
      field: 'PROJECT_CODE'
    },
    status: {
      type: DataTypes.STRING(16),
      allowNull: true,
      defaultValue: "1",
      field: 'STATUS'
    }
  }, {
    sequelize,
    tableName: 'PROJECT',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "PROJECT_ID" },
        ]
      },
      {
        name: "fk_ADMIN_DEPARTMENT_DEPT_CODE1",
        using: "BTREE",
        fields: [
          { name: "DEPT_CODE" },
        ]
      },
    ]
  });
};
