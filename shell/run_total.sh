python="/Users/dikers/opt/anaconda3/envs/deeplearning/bin/python"
user_rating_file="../data/ratings.txt"
train_file="../data/train_data.txt"
item_vec_file="../data/item_vec.txt"
item_sim_file="../data/sim_result.txt"
if [ -f $user_rating_file ]; then
    $python produce_train_data.py $user_rating_file $train_file
else
    echo "no rating file"
    exit
fi
if [ -f $train_file ]; then
    sh train.sh $train_file $item_vec_file
else
    echo "no train file"
    exit
fi
if [ -f $item_vec_file ]; then
    $python produce_item_sim.py $item_vec_file $item_sim_file
else
    echo "no item vec file"
    exit
fi


train.sh   '../raw-data/english_train.txt'   '../target/vec.txt'