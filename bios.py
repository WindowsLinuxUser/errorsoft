import pygame
import time
# import pcstringtable
# import renderer

DispHeight = 480
DispLength = 360

pygame.init()

white = (255, 255, 255)
screen = pygame.display.set_mode((DispHeight, DispLength))
clock = pygame.time.Clock()
pygame.display.set_caption("Errorsoft 1.0")

def TextObj(text, font):
    TextSurface = font.render(text, True, white)
    return TextSurface, TextSurface.get_rect()

def DispText(text):
    largeText = pygame.font.Font('segoeui.ttf', 115)
    TextSurf, TextRect = TextObj(text, largeText)
    TextRect.center = ((DispHeight/2),(DispLength/2))
    screen.blit(TextSurf, TextRect)

    pygame.display.update()

    time.sleep(2)


DispText("hi")

def gameLoop():

    Running = True

    while Running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                Running = False
    pygame.display.update()
    clock.tick(60)
        
gameLoop()
pygame.quit()
quit()