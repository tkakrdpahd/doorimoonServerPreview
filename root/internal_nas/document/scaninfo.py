import os

import mysql.connector

def verify_user(username, password):
    # MySQL 연결 설정
    mydb = mysql.connector.connect(
        host="localhost",
        user="username",
        password="password",
        database="mydatabase"
    )

    # MySQL에서 사용자 정보 가져오기
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = mycursor.fetchone()

    if user is not None:
        # 사용자 정보와 입력한 정보 비교
        if user[1] == password:
            print("로그인 성공")
            # 로그인 성공 후 처리할 로직 추가
        else:
            print("비밀번호가 일치하지 않습니다.")
    else:
        print("사용자가 존재하지 않습니다.")

    # MySQL 연결 종료
    mydb.close()

def list_subdirectories(path):
    subdirectories = []
    for entry in os.scandir(path):
        if entry.is_dir():
            subdirectories.append(entry.name)
    return subdirectories

subdirectories = list_subdirectories('/root/internal_nas/document')
print(subdirectories)
