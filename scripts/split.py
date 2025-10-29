from PIL import Image
import os

def split_image_into_columns(image_path, output_dir):
    # Load the image
    image = Image.open(image_path)
    width, height = image.size

    # Calculate column width
    column_width = width // 6

    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Split the image into 6 columns
    for i in range(6):
        left = i * column_width
        right = (i + 1) * column_width if i < 5 else width  # Ensure last column captures remaining pixels
        box = (left, 0, right, height)
        column = image.crop(box)
        column.save(os.path.join(output_dir, f"column_{i + 1}.png"))

# Example usage
split_image_into_columns("/home/geroshima/Downloads/tesapea-050525-post.png", "output_columns")

