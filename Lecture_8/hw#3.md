### Overview

1. Change code of your practical work to correspond with SOLID principles.
2. Add check for HTTP response status  and raise exception in next cases:
    1. `ArgumentError` if status is 4xx or 5xx
    2. `TypeError` if file is not a CSV
