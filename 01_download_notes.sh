#download notes zip
curl -O https://ton.twimg.com/birdwatch-public-data/2025/06/16/notes/notes-00000.zip

for i in $(seq -w 0 19); do
    curl -O https://ton.twimg.com/birdwatch-public-data/2025/06/16/noteRatings/ratings-000${i}.zip
done
