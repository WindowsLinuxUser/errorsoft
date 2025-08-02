import pygame
import time
import pcstringtable

pygame.init()

screen = pygame.display.set_mode((480, 360))
clock = pygame.time.Clock()
pygame.display.set_caption("Errorsoft 1.0")

def init():
    GameRunning = True

while GameRunning:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            GameRunning = False
    screen.fill(pcstringtable.fontrender.white)
    
    time.sleep(5)
        
pygame.quit()