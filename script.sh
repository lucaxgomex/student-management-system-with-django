ENV_NAME="env"

if [ -d "$ENV_NAME" ]; then
	echo "This virtual ambient '$ENV_NAME' already exists"
	echo "Deleting it..."

	rm -rf "$ENV_NAME"
else
	echo "Such a virtual ambient does not exist"
fi

echo "Creating a new virtual ambient called '$ENV_NAME'"
echo "Creating it..."

python3 -m venv "$ENV_NAME"
./"$ENV_NAME"/bin/activate

pip install -r requirements.txt

if [ $? -eq 0 ]; then
	echo "'$ENV_NAME' successfully created!"
else
	echo "Unknown Error"
	echo "Aborting..."
	exit 1
fi
