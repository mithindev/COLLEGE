#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Card {
    int value;
    char suit;
    struct Card* next;
};

void insertAtBeginning(struct Card** head_ref, int value, char suit) {
    struct Card* new_card = (struct Card*)malloc(sizeof(struct Card));
    new_card->value = value;
    new_card->suit = suit;
    new_card->next = (*head_ref);
    (*head_ref) = new_card;
}

void printCards(struct Card* head) {
    struct Card* current = head;
    while (current != NULL) {
        if (current->value >= 2 && current->value <= 10) {
            printf("%2d", current->value);
        } else {
            switch (current->value) {
                case 11:
                    printf(" J");
                    break;
                case 12:
                    printf(" Q");
                    break;
                case 13:
                    printf(" K");
                    break;
                case 14:
                    printf(" A");
                    break;
            }
        }
        printf("%c ", current->suit);
        current = current->next;
    }
    printf("\n");
}

int main() {
    struct Card* deck = NULL;
    struct Card* player1_hand = NULL;
    struct Card* player2_hand = NULL;

    // Create deck of cards
    for (int i = 2; i <= 14; i++) {
        insertAtBeginning(&deck, i, 'H');
        insertAtBeginning(&deck, i, 'D');
        insertAtBeginning(&deck, i, 'C');
        insertAtBeginning(&deck, i, 'S');
    }

    // Shuffle deck of cards
    srand(time(NULL));
    for (int i = 0; i < 1000; i++) {
        int random_index1 = rand() % 52;
        int random_index2 = rand() % 52;
        struct Card* temp1 = deck;
        struct Card* temp2 = deck;
        for (int j = 0; j < random_index1; j++) {
            temp1 = temp1->next;
        }
        for (int j = 0; j < random_index2; j++) {
            temp2 = temp2->next;
        }
        int temp_value = temp1->value;
        char temp_suit = temp1->suit;
        temp1->value = temp2->value;
        temp1->suit = temp2->suit;
        temp2->value = temp_value;
        temp2->suit = temp_suit;
    }

    // Deal cards to players
    struct Card* current = deck;
    for (int i = 0; i < 26; i++) {
        insertAtBeginning(&player1_hand, current->value, current->suit);
        current = current->next;
        insertAtBeginning(&player2_hand, current->value, current->suit);
        current = current->next;
    }

    // Print cards in each player's hand
    printf("Player 1's hand: ");
    printCards(player1_hand);
    printf("Player 2's hand: ");
    printCards(player2_hand);

    return 0;
}
