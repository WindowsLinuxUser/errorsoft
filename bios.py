import pygame
import time
# import pcstringtable
import renderer

pygame.init()

screen = pygame.display.set_mode((480, 360))
clock = pygame.time.Clock()
pygame.display.set_caption("Errorsoft 1.0")

biosfont = renderer.biosfont
Msg1 = renderer.biosfont.render('srt', False, renderer.white)
Msg1Rect = Msg1.get_rect()
Msg1Rect.Center = (400 // 2, 400 // 2)

screen.fill(renderer.black)
screen.blit(Msg1, Msg1Rect)
pygame.display.update()

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            GameRunning = False
        
pygame.quit()