print("Welcome to Treasure island.\nYour mission is to find the treasure.")
direction=input("left or right ? ")
if direction=="right":
    print("Game Over")
else:
    if input("swim or wait ? ") == 'swim':
        print("Game Over")
    else:
        if input("Which door , red, blue , yellow ? ") == "yellow":
            print("You win")
        else:
            print("Game Over")