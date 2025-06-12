export NOLIMA_RESULT=/mnt/longcontext/models/siyuan/nolima_result
export MODEL_PATH="/mnt/longcontext/models/siyuan/llama3/Qwen2.5-7B-Instruct-YaRN"
export MODEL_NAME=$(basename "$MODEL_PATH")
export CUSTOM_MODEL_CONFIG=custom_think
export NEEDLE_SET_NAME="needle_set_w_CoT"
export MAX_TOKENS=2048
export TEMPERATURE=0.6
test_lengths=(250 500 1K 2K 4K 8K 16K 32K)
echo $MODEL_PATH
echo $MODEL_NAME
# echo all the configurations
echo "======================================="
echo "MODEL_PATH: $MODEL_PATH"
echo "MODEL_NAME: $MODEL_NAME"
echo "CUSTOM_MODEL_CONFIG: $CUSTOM_MODEL_CONFIG"
echo "NEEDLE_SET_NAME: $NEEDLE_SET_NAME"
echo "MAX_TOKENS: $MAX_TOKENS"
echo "TEMPERATURE: $TEMPERATURE"
echo "test_lengths: ${test_lengths[@]}"
echo "======================================="

export PYTHONPATH="../"
echo $$
# python -u run_tests.py --config run_config/multi_test_config_book_250_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_500_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_1K_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_2K_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_4K_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_8K_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_16K_custom.yaml
# python -u run_tests.py --config run_config/multi_test_config_book_32K_custom.yaml
for test_length in "${test_lengths[@]}"; do
  echo "Running test with length: $test_length"
  python -u run_tests.py --config "run_config/multi_test_config_book_${test_length}_custom.yaml"
done
