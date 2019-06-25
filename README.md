# 🚗 sortr.ai 🚗
Submission by Daniel Wyckoff and Owen Linton for [TerribleHackXIII](https://devpost.com/software/sortr-ai "Submission Page")
The world's leading sorting solution.
Its uber but for sorting.  Drive for us at: http://sortrai.herokuapp.com/

## What does it do?
Sortr.ai promises to deliver list sorting in O(1) time via our propriatary software.

## How do I use this amazing software???
1. Pay us lots of money.
2. Send your requests to our endpoint https://sortrai.herokuapp.com/api/v1/sorting_request

Example: curl -d '{"sorting_request":{"list":[2, 2, 1, 4, 5]}}' -H "Content-Type: application/json" -X POST https://sortrai.herokuapp.com/api/v1/sorting_request

Response: [1, 2, 2, 4, 5]

## So whats the secret sauce
Our amazing uber drivers respond to your sorting request (through our fantastic 90s UI) while the connection stays alive :)
