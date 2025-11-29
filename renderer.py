import pygame

pygame.init()

screen = pygame.display.set_mode((1, 1))
global biosImg
biosImg = pygame.image.load('images/bootup.bmp').convert()
biosImg_rect = biosImg.get_rect()

#pygame.quit()