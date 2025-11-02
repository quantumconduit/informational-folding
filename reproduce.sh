#!/bin/bash
echo "=== INFORMATIONAL FOLDING v4 — REPRODUCTION ==="
echo "Installing numpy..."
pip3 install numpy > /dev/null 2>&1

echo "Running prime_fold.py for rank 1,000,000,000..."
start=$(date +%s.%N)
python3 prime_fold.py 1000000000 > result.json
end=$(date +%s.%N)
elapsed=$(echo "$end - $start" | bc -l)

echo "=== RESULT ==="
cat result.json
echo "Elapsed: ${elapsed}s"

echo "=== SHA256 VERIFICATION ==="
echo "Expected: 5a5db75d10c0cab6b0eee6baad1fc13d8cb81d2f7f7fb434df22586c49e80006"
sha256sum prime_fold.py

echo "=== DONE ==="
