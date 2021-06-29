const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('adminDepartment', {
    deptCode: {
      type: DataTypes.STRING(8),
      allowNull: false,
      primaryKey: true,
      field: 'DEPT_CODE'
    },
    parentDeptCode: {
      type: DataTypes.STRING(8),
      allowNull: true,
      field: 'PARENT_DEPT_CODE'
    },
    name: {
      type: DataTypes.STRING(45),
      allowNull: false,
      field: 'NAME'
    },
    type: {
      type: DataTypes.STRING(10),
      allowNull: false,
      field: 'TYPE'
    },
    description: {
      type: DataTypes.STRING(2000),
      allowNull: true,
      field: 'DESCRIPTION'
    },
    deptOrder: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: 'DEPT_ORDER'
    },
    status: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'STATUS'
    },
    createTime: {
      type: DataTypes.DATE,
      allowNull: false,
      field: 'CREATE_TIME'
    },
    updateTime: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'UPDATE_TIME'
    }
  }, {
    sequelize,
    tableName: 'ADMIN_DEPARTMENT',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "DEPT_CODE" },
        ]
      },
      {
        name: "FK_PARENT_ID",
        using: "BTREE",
        fields: [
          { name: "PARENT_DEPT_CODE" },
        ]
      },
      {
        name: "fk_ADMIN_MENU_1",
        using: "BTREE",
        fields: [
          { name: "PARENT_DEPT_CODE" },
        ]
      },
    ]
  });
};
