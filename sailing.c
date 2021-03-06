#include "sailing.h"

int isChanceNode_sailing(rep_t rep) {
  int *game = rep;
  if (game[SAILING_STATE_TYPE] == SAILING_STATE_CHANCE)
    return true;
  return false;
}

//if move is with the direction of the wind then there is no change of tack
//else, tack is based on the current wind and the chosen move.
int computeTack(int *game, int move) {
  int wind = game[WIND] - move + 1; //normlize wind in regards of move
  move = 1; //normlize move
  
  if (wind == 1)
    return 0; //away tack
  else if (wind == 2 || wind == 3 || wind == 4)
    return -1; //left tack
  else
    return 1; //right tack
  
}

double actionCost_sailing(rep_t rep, int move) {
  int *game = rep;
  
  double cost = 1;
  //diagonal move
  if (move % 2 == 0)
    cost = sqrt(2);
  
  int stray = abs(game[WIND] - move);
  if (stray > 4)
    stray =  8 - stray;
  else if (stray == 4)
    stray = INF; //shouldn't happen - a move aginst the wind is impossible
  stray++;
  
  int delay = 0;
  //Tack change causes a delay;
  int tsum = computeTack(game, move) + game[TACK];
  if (tsum == 0 && game[TACK] != 0)
    delay = SAILING_DELAY;
  
  return -1 * (stray * cost + delay);
}

void printBoard_sailing(rep_t rep, int dummy) {
  int *game = rep;
  
  printf("Boat loc: (%d, %d)\n", game[BOAT_X], game[BOAT_Y]);
  if (game[TACK] == 1)
    printf("Tack: right\n");
  else if (game[TACK] == 0)
    printf("Tack: away\n");
  else
    printf("Tack: left\n");
  printf("Wind dir: %d\n", game[WIND]);
  printf("Goal loc: (%d, %d)\n", game[GOAL_X], game[GOAL_Y]);
}

int getNumOfChildren_sailing(rep_t rep, int side) {
    return SAILING_DIRECTIONS + 1;
}

int isValidChild_sailing(rep_t rep, int side, int move) {
    int *game = rep;
    int x = game[BOAT_X];
    int y = game[BOAT_Y];
    int wind = game[WIND];
    
    //If this is a chance node then the only legal children are in the possible directions of the new wind (45 degrees left or right)
    if (game[SAILING_STATE_TYPE] == SAILING_STATE_CHANCE) {
      if ((wind == SAILING_DIRECTIONS && move == 1) || (wind < SAILING_DIRECTIONS && move == wind + 1))
	return true;
      
      if (wind == move)
	return true;
      
      if ((wind == 1 && move == SAILING_DIRECTIONS) || (wind > 1 && move == wind - 1))
	return true;

      return false;
    }
    
    //can't go against the wind
    if (abs(move - wind) == 4)
      return false;
    
    //check right x boundery
    if ((move == 2 || move == 3 || move == 4) && x == SAILING_BOARD_SIZE - 1)
      return false;
    
    //check left x boundery
    if ((move == 6 || move == 7 || move == 8) && x == 0)
      return false;
    
    //check upper y boundery
    if ((move == 1 || move == 2 || move == 8) && y == SAILING_BOARD_SIZE - 1)
      return false;
    
    //check lower y boundery
    if ((move == 4 || move == 5 || move == 6) && y == 0)
      return false;

    return true;
}

int getGameStatus_sailing(rep_t rep) {
  int *game = rep;
  
  if (game[BOAT_X] == game[GOAL_X] && game[BOAT_Y] == game[GOAL_Y])
    return SAILING_MAX_WINS;
  
  return SAILING_INCOMPLETE;
}

//Select a "move" at a chance node in an MDP
int selectMoveStochastic_sailing(rep_t rep) {
	int *game = rep;
	int move = game[WIND];
	int windChange = random() % 100;

	if (0 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100) {
	  move = game[WIND] - 1;
	  if (move < 1)
	    move = SAILING_DIRECTIONS;
	} else if (SAILING_WIND_CHANGE_PROB * 100 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100 * 2) {
	  move = game[WIND] + 1;
	  if (move > SAILING_DIRECTIONS)
	    move = 1;
	}
	
	return move;
}

//if move is -1, and it is a chance node, than make a stochastic random move, else make the given move.
void makeMove_sailing(rep_t rep, int *side, int move) {
  int *game = rep;
  
  if (game[SAILING_STATE_TYPE] == SAILING_STATE_CHANCE) {
    if (move > 0) {
      game[WIND] = move;
      game[SAILING_STATE_TYPE] = SAILING_STATE_DET;
      return;
    }
    
    int windChange = random() % 100;
    
    if (0 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100) {
      game[WIND]--;
      if (game[WIND] < 1)
	game[WIND] = SAILING_DIRECTIONS;
    } else if (SAILING_WIND_CHANGE_PROB * 100 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100 * 2) {
      game[WIND]++;
      if (game[WIND] > SAILING_DIRECTIONS)
	game[WIND] = 1;
    }
    
    game[SAILING_STATE_TYPE] = SAILING_STATE_DET;
  } else {
    //x+1
    if (move == 2 || move == 3 || move == 4)
      game[BOAT_X]++;
    
    //x-1
    if (move == 6 || move == 7 || move == 8)
      game[BOAT_X]--;
    
    //y+1
    if (move == 1 || move == 2 || move == 8)
      game[BOAT_Y]++;
    
    //y-1
    if (move == 4 || move == 5 || move == 6)
      game[BOAT_Y]--;
    
    game[TACK] = computeTack(game, move);
    game[SAILING_STATE_TYPE] = SAILING_STATE_CHANCE;
  }
}

rep_t cloneRep_sailing(rep_t orig) {
   int i;
   int *game = orig;
   int *new_game = calloc(SAILING_REP_SIZE, sizeof(int));
   for (i = 0; i < SAILING_REP_SIZE; i++)
     new_game[i] = game[i];
   
   return new_game;
}

void generateRandomStart_sailing(rep_t rep, int *side) {
  int *game = rep;
  
  game[SAILING_STATE_TYPE] = SAILING_STATE_DET;
  
  game[BOAT_X] = 0;
  game[BOAT_Y] = 0;
  
  //game[TACK] = random() % 2;
  //game[WIND] = (random() % SAILING_DIRECTIONS) + 1;
  game[TACK] = 0;
  game[WIND] = 1;
  
  game[GOAL_X] = SAILING_BOARD_SIZE - 1;
  game[GOAL_Y] = SAILING_BOARD_SIZE - 1;
}

rep_t allocate_sailing() {
  return calloc(SAILING_REP_SIZE, sizeof(int));
}

void destructRep_sailing(rep_t rep) {
  free(rep);
}

void copy_sailing(rep_t src, rep_t dst) {
  int i;
  for (i = 0; i < SAILING_REP_SIZE; i++)
     ((int *)dst)[i] = ((int *)src)[i];
}

double applyHeuristics_sailing(heuristics_t h, rep_t rep, int side, int budget) {

   rep_t clone = cloneRep_sailing(rep);
   double ret = h(clone, side, budget);
   destructRep_sailing(clone);
   
   return ret;
}

int *generateWeather(int wind) {
  int *weather = calloc(SAILING_HORIZION, sizeof(int));
  weather[0] = wind;
  
  int i;
  for (i = 1; i < SAILING_HORIZION; i++) {
    int windChange = random() % 100;
    
    if (0 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100) {
      wind--;
      if (wind < 1)
	wind = SAILING_DIRECTIONS;
    } else if (SAILING_WIND_CHANGE_PROB * 100 <= windChange && windChange < SAILING_WIND_CHANGE_PROB * 100 * 2) {
      wind++;
      if (wind > SAILING_DIRECTIONS)
	wind = 1;
    }
    
    weather[i] = wind;
  }
  
  return weather;
}

double ****V = 0;
extern double noise_level;

double h1_sailing(rep_t rep, int side, int horizion) {
  int *dummy = allocate_sailing();
  copy_sailing(rep, dummy);
  
  int steps;
  for (steps = 0; ((random() % 10000000) / (double)10000000) < (1 / (double)(steps + 1)); steps++) {
    if (dummy[SAILING_STATE_TYPE] == SAILING_STATE_CHANCE) {
      makeMove_sailing(dummy, 0, -1);
    } else {
      int move;
      do {
        move = (random() % 8) + 1;
      } while (!isValidChild_sailing(dummy, 0, move));
      makeMove_sailing(dummy, 0, move);
    }
  }

  if (V == 0)
    V = value_iteration();
  
  int *game = dummy;
  double epsi = ((double)rand() / (double)RAND_MAX)*(noise_level*2) -noise_level ;
 // double epsi = (random() % 10000000) / (double)50000000 - 0.1; //randomly choose from [-0.1,0.1]
  double val = V[game[BOAT_X]][game[BOAT_Y]][game[WIND] - 1][game[TACK] + 1];
  destructRep_sailing(game);
  return (1 + epsi) * val;
}

double h2_sailing(rep_t rep, int side, int horizion) {
  int *game = rep;
  
  int dx = abs(game[BOAT_X] - game[GOAL_X]);
  int dy = abs(game[BOAT_Y] - game[GOAL_Y]);
  
  int diagonal = MIN(dx, dy);
  int straight = MAX(dx, dy) - diagonal;
  
  return -1 * (straight + sqrt(2) * diagonal);
}

double h3_sailing(rep_t rep, int side, int horizion) {
  return 0;
}

double h4_sailing(rep_t rep, int side, int horizion) {
  return 0;
}

double h5_sailing(rep_t rep, int side, int horizion) {
  return 0;
}

double h6_sailing(rep_t rep, int side, int horizion) {
  return 0;
}

int estimateTreeSize_sailing(int treeSize) {
  return -1;
}
