function palindromic() {
    /* Return the palindromic phones numbers */
    var cursor = db.phones.find();
    while (cursor.hasNext()) {
        var number = cursor.next()._id.toString();
        number = number.substring(3);
        if (number === number.split('').reverse().join('')) {
            printjson(number);
        }
    }
}


function diferentDigits() {
    /* Return the numbers that have diferent digits */
    var cursor = db.phones.find();
    while (cursor.hasNext()) {
        var number = cursor.next()._id.toString();
        number = number.substring(3);
        var digits = number.split('');
        var uniqueDigits = digits.filter(function (elem, index, self) {
            return index == self.indexOf(elem);
        });
        if (digits.length === uniqueDigits.length) {
            printjson(number);
        }
    }
}
