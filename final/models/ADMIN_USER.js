const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('adminUser', {
    id: {
      type: DataTypes.STRING(32),
      allowNull: false,
      defaultValue: "",
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(64),
      allowNull: false,
      field: 'NAME'
    },
    password: {
      type: DataTypes.STRING(64),
      allowNull: false,
      field: 'PASSWORD'
    },
    groupId: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'ADMIN_GROUP',
        key: 'ID'
      },
      field: 'GROUP_ID'
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
    },
    email: {
      type: DataTypes.STRING(32),
      allowNull: true,
      field: 'EMAIL'
    },
    department: {
      type: DataTypes.STRING(8),
      allowNull: true,
      field: 'DEPARTMENT'
    },
    rank: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'RANK'
    },
    position: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'POSITION'
    },
    sex: {
      type: DataTypes.STRING(8),
      allowNull: true,
      field: 'SEX'
    },
    address: {
      type: DataTypes.STRING(128),
      allowNull: true,
      field: 'ADDRESS'
    },
    officePhone: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'OFFICE_PHONE'
    },
    mobilePhone: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'MOBILE_PHONE'
    },
    familyPhone: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'FAMILY_PHONE'
    },
    executive: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'EXECUTIVE'
    },
    status: {
      type: DataTypes.STRING(8),
      allowNull: true,
      field: 'STATUS'
    },
    timeFlowClass: {
      type: DataTypes.STRING(32),
      allowNull: true,
      defaultValue: "",
      field: 'TIME_FLOW_CLASS'
    },
    standardWorkHours: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 8,
      field: 'STANDARD_WORK_HOURS'
    },
    fcmToken: {
      type: DataTypes.STRING(1024),
      allowNull: true,
      defaultValue: "",
      field: 'FCM_TOKEN'
    }
  }, {
    sequelize,
    tableName: 'ADMIN_USER',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ID" },
        ]
      },
      {
        name: "FK_USER_GROUP",
        using: "BTREE",
        fields: [
          { name: "GROUP_ID" },
        ]
      },
    ]
  });
};
