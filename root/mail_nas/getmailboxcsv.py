import os
import csv

def generate_file_list(starting_dir):
    file_list = []
    for root, dirs, files in os.walk(starting_dir):
        for file in files:
            file_path = os.path.join(root, file)
            file_list.append(file_path)
    return file_list

def create_csv(file_list, output_file):
    with open(output_file, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['file_path'])
        for file_path in file_list:
            writer.writerow([file_path])

if __name__ == '__main__':
    starting_dir = '/'
    file_list = generate_file_list(starting_dir)
    output_file = 'file_list.csv'
    create_csv(file_list, output_file)
