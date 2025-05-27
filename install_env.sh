source /opt/conda/etc/profile.d/conda.sh 
conda create --name nolima python==3.10 -y
conda activate nolima
pip install -r requirements.txt
bash data/download_NoLiMa_data.sh