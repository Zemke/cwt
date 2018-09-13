#!/usr/bin/env bash

curl 'http://192.168.178.25:9000/api/tournament/current/group/many' -H 'Pragma: no-cache' -H 'Origin: http://192.168.178.25:4300' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9,de-DE;q=0.8,de;q=0.7' -H 'Authorization: eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJaZW1rZSIsImNyZWF0ZWQiOjE1MzA0NjEyMTAzMDksImNvbnRleHQiOnsidXNlciI6eyJpZCI6MSwidXNlcm5hbWUiOiJaZW1rZSIsImVtYWlsIjoiZmx6ZW1rZUBnbWFpbC5jb20iLCJyb2xlcyI6WyJST0xFX1VTRVIiLCJST0xFX0FETUlOIl0sImVuYWJsZWQiOnRydWV9fSwiZXhwIjoxNTMxMDY2MDEwfQ.F654gOBN0Bmd5FMsqlofoa48fwACTxMHbtIB572OtHSIk4kWdpG0YlKz6sum9pRBqIweSm4KoVZZCRWvKDDrIA' -H 'content-type: application/json' -H 'Accept: application/json, text/plain, */*' -H 'Cache-Control: no-cache' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36' -H 'Connection: keep-alive' -H 'Referer: http://192.168.178.25:4300/admin/groups/start' --data-binary $'[\n  {\n    "label": "A",\n    "users": [\n      1,\n      6,\n      10,\n      26\n    ]\n  },\n  {\n    "label": "B",\n    "users": [\n      4,\n      5,\n      9,\n      11\n    ]\n  },\n  {\n    "label": "C",\n    "users": [\n      13,\n      16,\n      20,\n      22\n    ]\n  },\n  {\n    "label": "D",\n    "users": [\n      23,\n      24,\n      28,\n      29\n    ]\n  },\n  {\n    "label": "E",\n    "users": [\n      32,\n      34,\n      41,\n      54\n    ]\n  },\n  {\n    "label": "F",\n    "users": [\n      58,\n      69,\n      78,\n      79\n    ]\n  },\n  {\n    "label": "G",\n    "users": [\n      83,\n      93,\n      102,\n      14\n    ]\n  },\n  {\n    "label": "H",\n    "users": [\n      103,\n      104,\n      7,\n      12\n    ]\n  }\n]' --compressed
