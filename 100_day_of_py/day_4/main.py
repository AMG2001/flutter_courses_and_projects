import shapes 
import random

endGame = False

def userChoice():
    inpt= int(input("Choose rock : 1 / paper : 2 / scissors : 3 ? "))
    if(inpt==1) : return "rock"
    elif inpt ==2 : return "paper"
    elif inpt == 3 : return "scissors" 
    # else: userChoice()

def computerChoice():
    choice =  int(random.randint(1,3))
    if(choice == 1): return "rock"
    elif choice ==2 : return "paper"
    else : return "scissors"

def checkEndGame():
    global endGame
    inpt = input("Want to end the game ? Y / N ")
    if inpt == "y" or inpt == "Y" : endGame = True
    else: endGame = False

def checkWinner(userChoice,computerChoice):
    print(f"user choose : {userChoice} , computer choose : {computerChoice}")
    if(userChoice == computerChoice) : print("Draw")
    elif(userChoice == "rock"):
        if(computerChoice == "paper"): print("Computer Win !!")
        elif(computerChoice == "scissors"):print("User Win !!")
    elif(userChoice == "paper"):
        if(computerChoice == "rock"):print("User Win !!")
        elif(computerChoice == "scissors"):print("Computer Win !!")
    elif(userChoice == "scissors"):
        if(computerChoice == "rock"):print("Computer Win !!")
        elif(computerChoice == "paper") : print("User Win !!")
    checkEndGame()

while(not endGame):
    checkWinner(userChoice(),computerChoice())