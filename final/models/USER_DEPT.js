const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('userDept', {
    userId: {
      type: DataTypes.STRING(32),
      allowNull: true,
      field: 'USER_ID',
      primaryKey: true
    },
    deptCode: {
      type: DataTypes.STRING(16),
      allowNull: false,
      references: {
        model: 'ADMIN_DEPARTMENT',
        key: 'DEPT_CODE'
      },
      field: 'DEPT_CODE'
    },
    createTime: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'CREATE_TIME'
    },
    updateTime: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'UPDATE_TIME'
    }
  }, {
    sequelize,
    tableName: 'USER_DEPT',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "fk_ADMIN_USER_USER_ID1",
        using: "BTREE",
        fields: [
          { name: "USER_ID" },
        ]
      },
      {
        name: "fk_ADMIN_DEPARTMENT_TEST_DEPT_CODE",
        using: "BTREE",
        fields: [
          { name: "DEPT_CODE" },
        ]
      },
    ]
  });
};
