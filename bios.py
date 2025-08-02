import pygame
import time
import faulthandler
faulthandler.enable()
# import pcstringtable
import fontrender

pygame.init()

screen = pygame.display.set_mode((480, 360))
clock = pygame.time.Clock()
pygame.display.set_caption("Errorsoft 1.0")


GameRunning = True

screen.fill(fontrender.white)
pygame.display.update()

while GameRunning:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            GameRunning = False
        
pygame.quit()