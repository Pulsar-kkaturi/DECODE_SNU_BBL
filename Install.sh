os=$1
name=$2

echo "# OS: $os (window or mac)"
echo "# ENV_NAME: $name"

if [ $os = window ];then
    conda create -y -n $name -c turagalab -c pytorch -c conda-forge decode=0.10.0 cudatoolkit=11.0 jupyterlab ipykernel
elif [ $os = mac ];then
    conda create -y -n $name -c turagalab -c pytorch -c conda-forge decode=0.10.0 jupyterlab ipykernel
else
    echo "!ERROR! Check your os name"
fi

if [ $os = window ] && [ $os = mac ];then
    conda update -y -n $name -c turagalab -c pytorch -c conda-forge decode
fi
echo "# DECODE Install Completed!"