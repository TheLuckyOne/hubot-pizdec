cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.hear /fuck\b/i, (msg) ->
            robot.http('http://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=RUB').get() (err, res, body) ->
                $ = cheerio.load(body)
                usd = $("td[class='rightCol']").eq(0).text()
                msg.send "USD: " + Number(usd.replace(/[^0-9\.-]+/g, ""))

            robot.http('http://www.xe.com/currencyconverter/convert/?Amount=1&From=EUR&To=RUB').get() (err, res, body) ->
                $ = cheerio.load(body)
                eur = $("td[class='rightCol']").eq(0).text()
                msg.send "EUR: " + Number(eur.replace(/[^0-9\.-]+/g, ""))
            robot.http('http://www.investing.com/commodities/brent-oil').get() (err, res, body) ->
                $ = cheerio.load(body)
                brent = $("span[id='last_last']").text()
                msg.send "Brent: " + brent
