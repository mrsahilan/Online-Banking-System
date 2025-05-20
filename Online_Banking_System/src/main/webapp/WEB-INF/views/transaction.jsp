<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, com.nit.entity.Transaction"%>
<html>
<head>
    <title>Transaction History</title>
    <style>
        /* Body and background */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(to bottom, #FF9933 0%, #FF9933 33%, #F0F0F0 40%, #FFFFFF 50%, #F0F0F0 60%, #138808 67%, #138808 100%);
            background-size: 300% 100%;
            animation: horizontalWave 45s linear infinite;
            color: #212529;
            overflow: hidden;
        }

        @keyframes horizontalWave {
            0% {
                background-position: 0% 0%;
            }
            100% {
                background-position: 300% 0%;
            }
        }

        /* Container for the whole content */
        .transaction-container {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px 35px 80px; /* Extra bottom padding for buttons */
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            width: 90vw;
            max-width: 900px;
            max-height: 90vh;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 25px;
            position: relative; /* for button-row positioning */
            z-index: 10;
        }

        /* Heading */
        h2 {
            font-size: 28px;
            font-weight: 700;
            color: #FF9933; /* saffron */
            text-align: center;
            margin: 0;
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: #212529;
            font-size: 15px;
        }

        th {
            background: linear-gradient(90deg, #138808, #0B610B);
            /* green gradient */
            color: white;
            font-weight: 700;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: #FFEBCC; /* very light saffron highlight */
        }

        /* No data message */
        .no-data {
            text-align: center;
            font-weight: 700;
            font-size: 16px;
            color: #d93025; /* red */
            margin: 40px 0;
        }

        /* Scrollbar styling for container */
        .transaction-container::-webkit-scrollbar {
            width: 8px;
        }

        .transaction-container::-webkit-scrollbar-thumb {
            background-color: rgba(19, 136, 8, 0.5);
            border-radius: 12px;
        }

        /* Button row fixed at bottom inside container */
        .button-row {
            position: sticky;
            bottom: 0;
            background: rgba(255, 255, 255, 0.9);
            padding-top: 15px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
            box-shadow: 0 -5px 10px rgba(0,0,0,0.1);
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .btn-saffron {
            background: linear-gradient(90deg, #FF9800, #FF6F00);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            flex: 1;
            box-shadow: 0 4px 12px rgba(255, 111, 0, 0.4);
            transition: background 0.3s ease;
        }

        .btn-saffron:hover {
            background: linear-gradient(90deg, #F57C00, #E65100);
        }

        .btn-green {
            background: linear-gradient(90deg, #138808, #0B610B);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            text-align: center;
            cursor: pointer;
            flex: 1;
            box-shadow: 0 4px 12px rgba(19, 136, 8, 0.4);
            transition: background 0.3s ease;
        }

        .btn-green:hover {
            background: linear-gradient(90deg, #0B610B, #06470A);
        }

        @media (max-width: 600px) {
            .transaction-container {
                padding: 30px 20px 100px; /* increased bottom padding on small */
            }

            th, td {
                padding: 10px 8px;
                font-size: 13px;
            }

            .button-row {
                flex-direction: column;
                gap: 12px;
                position: static; /* to avoid sticky issues on mobile */
                padding-top: 10px;
                border-radius: 0;
                box-shadow: none;
            }

            .btn-saffron,
            .btn-green {
                width: 100%;
                flex: none;
            }
        }
    </style>
</head>
<body>
    <div class="transaction-container">
        <h2>Your Transaction History</h2>

        <%
        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
        if (transactions == null || transactions.isEmpty()) {
        %>
        <p class="no-data">No transactions found.</p>
        <%
        } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Description</th>
                    <th>Sender</th>
                    <th>Receiver</th>
                    <th>Timestamp</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Transaction t : transactions) {
                %>
                <tr>
                    <td><%=t.getTransactionCode()%></td>
                    <td><%=t.getTransactionType()%></td>
                    <td>₹<%=t.getAmount()%></td>
                    <td><%=t.getDescription()%></td>
                    <td><%=t.getSenderName()%></td>
                    <td><%=t.getReceiverName()%></td>
                    <td><%=t.getTimestamp()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <%
        }
        %>

        <!-- Buttons fixed/sticky at bottom inside container -->
        <div class="button-row">
            <a href="/dashboard" class="btn-saffron">Dashboard</a>
            <form action="/logout" method="post" style="flex: 1; margin: 0; padding: 0;">
                <button type="submit" class="btn-green" style="width: 100%;">Logout</button>
            </form>
        </div>
    </div>
</body>
</html>
