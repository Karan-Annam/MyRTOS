#ifndef TASK_H
#define TASK_H


#define MAX_TASKS 10

typedef void (*TaskFunction)(void);

typedef struct {
    TaskFunction func;
    // Add other params later as needed
} Task;

void addTask(TaskFunction func);
void removeTask(TaskFunction func);
void runTasks(void);

extern Task taskList[MAX_TASKS];
extern int taskCount;

#endif 