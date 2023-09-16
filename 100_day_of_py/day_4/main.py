import random

endGame = False

def userChoice():
    inpt= int(input("Choose rock : 1 / paper : 2 / scissors : 3 ? "))
    if(inpt==1) : return "rock"
    elif inpt ==2 : return "paper"
    elif inpt == 3 : return "scissors" 

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

def getShape(name_of_shape):
    if(name_of_shape == "rock"): return '''
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
'''
    elif(name_of_shape == "paper"): return '''
    _______
---'   ____)____
          ______)
          _______)
         _______)
---.__________)
'''
    else : return '''
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
'''


def showResult(userChoice, computerChice , result):
    return f'''
            user choose : {getShape(userChoice)},
            computer choose : {getShape(computerChice)}
            Result : {result} 
            '''

def checkWinner(userChoice,computerChoice):

    if(userChoice == computerChoice) : print(showResult(userChoice,computerChoice,"Draw"))
    elif(userChoice == "rock"):
        if(computerChoice == "paper"): print(showResult(userChoice,computerChoice,"Computer Win !!"))
        elif(computerChoice == "scissors"):print(showResult(userChoice,computerChoice,"User Win !!"))
    elif(userChoice == "paper"):
        if(computerChoice == "rock"):print(showResult(userChoice,computerChoice,"User Win !!"))
        elif(computerChoice == "scissors"):print(showResult(userChoice,computerChoice,"Computer Win !!"))
    elif(userChoice == "scissors"):
        if(computerChoice == "rock"):print(showResult(userChoice,computerChoice,"Computer Win !!"))
        elif(computerChoice == "paper") : print(showResult(userChoice,computerChoice,"User Win !!"))
    checkEndGame()

while(not endGame):
    checkWinner(userChoice(),computerChoice())
