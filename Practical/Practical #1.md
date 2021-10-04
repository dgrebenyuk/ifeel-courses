### Implementation Steps
1. Create class `CSVParser`
2. Create class `ParseResponse` with the field 'list'
3. Add class method `parse_from(url)` which should do the next logic:
    1. Use `faraday` to get response from url
    2. Save response to local csv file
    3. Parse csv
    4. Return an object of class `ParseResponse`
4. Add a method `search` to `ParseResponse` class which should return cities with 3 words

### Gems
- <https://github.com/lostisland/faraday>

### Useful Links

- <https://raw.githubusercontent.com/dgrebenyuk/ifeel-courses/master/Practical/cities.csv>
- <https://ruby-doc.org/core-3.0.2/File.html#method-c-open>
- <http://rubular.com>
