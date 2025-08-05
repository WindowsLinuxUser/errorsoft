import pygame

pygame.init()

screen = pygame.display.set_mode((480, 360))
global biosImg
biosImg = pygame.image.load('images/bioslogo.bmp').convert()

#pygame.quit()