const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('projectUserMap', {
    projectId: {
      type: DataTypes.SMALLINT,
      allowNull: true,
      primaryKey: true,
      field: 'PROJECT_ID'
    },
    userId: {
      type: DataTypes.CHAR(16),
      allowNull: false,
      defaultValue: "",
      field: 'USER_ID'
    },
    status: {
      type: DataTypes.STRING(16),
      allowNull: true,
      field: 'STATUS'
    }
  }, {
    sequelize,
    tableName: 'PROJECT_USER_MAP',
    timestamps: false,
    freezeTableName: true,
    indexes: [
      {
        name: "PROJECT_USER_MAP",
        using: "BTREE",
        fields: [
          { name: "PROJECT_ID" },
          { name: "USER_ID" },
        ]
      },
    ]
  });
};
