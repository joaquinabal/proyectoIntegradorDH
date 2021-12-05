module.exports = function(sequelize, dataTypes) {
    let alias = "User";

    let cols = {
        id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        name: {
            type: dataTypes.STRING,
            allowNull: false
        },
        email: {
            type: dataTypes.STRING,
            allowNull: false
        },
        password: {
            type: dataTypes.STRING,
            allowNull: false
        },
        creation_date: {
            type: dataTypes.DATE(6),
            allowNull: false
        },
        admin: {
            type: dataTypes.BOOLEAN,
            allowNull: false
        },
    };

    let config = {
        tableName: "users",
        timestamps: "false"
    }

    let User = sequelize.define(alias, cols, config);

    User.associate = function(models) {
        User.hasMany()
    }

    return User
}