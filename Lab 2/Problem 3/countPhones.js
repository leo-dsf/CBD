countPhones = function () {
    /* Count the number of phones in each prefix */
    var cursor = db.phones.aggregate([
        { $group: { _id: "$components.prefix", count: { $sum: 1 } } },
        { $sort: { _id: 1 } }
    ]);
    while (cursor.hasNext()) {
        printjson(cursor.next());
    }
}
